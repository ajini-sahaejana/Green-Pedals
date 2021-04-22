import React, { useState, useEffect } from "react";
import { BootstrapTable, TableHeaderColumn } from "react-bootstrap-table";
import { AuthUserContext, withAuthorization } from "./../../../Session";
import { withFirebase } from "./../../../Firebase";
const Users = (props) => {

    const [loading, setLoading] = useState(false);
    const [users, setUsers] = useState([]);
    const options = {
        afterDeleteRow: onAfterDeleteRow,
        afterInsertRow: onAfterInsertRow,
    };
    const selectRowProp = {
        mode: "checkbox",
    };

    useEffect(() => {
        setLoading(true);
        function fetchUsers(snapshot) {
            var usersList = [];
            snapshot.docs.forEach((doc, i) => {
                usersList.push({
                    id: i,
                    uuid: doc.id,
                    ...doc.data(),
                });
            });
            setUsers(usersList);
            setLoading(false);
        }
        props.firebase.store.collection("users").get().then(fetchUsers);
        return () => {
            props.firebase.users().off();
        };
    }, [props.firebase]);

    function onAfterDeleteRow(event) {
        event.map((e) => {
            props.firebase.store.collection("users").doc(users[e].uuid).delete();
        });
        setTimeout(() => {
            props.firebase.store
                .collection("users")
                .get()
                .then((snapshot) => {
                    var usersList = [];
                    snapshot.docs.forEach((doc, i) => {
                        usersList.push({
                            id: i,
                            uuid: doc.id,
                            ...doc.data(),
                        });
                    });
                    setUsers(usersList);
                });
        }, 1000);
    }

    function onAfterInsertRow(event) {
        const user = {
            username: event.username,
            email: event.email,
            id: event.id
        };
        props.firebase.store
            .collection("users")
            .add(user)
            .then((ref) => {
                user.uuid = ref.id;
                user.id = users.length;
                var newUsers = users.slice();
                newUsers.push(user);
                console.log(users);
                setUsers(newUsers);
            });
    }

    return (
        <AuthUserContext.Consumer>
            {(authUser) => (
                <div className="auth-content p-2">
                    <h1 style={{marginBottom:"20px"}}>User List</h1>
                    {loading && <div>Loading ...</div>}
                    <BootstrapTable
                        data={users}
                        insertRow={true}
                        deleteRow={true}
                        selectRow={selectRowProp}
                        options={options}
                    >
                        <TableHeaderColumn dataField="id" isKey={true}>
                            No
                        </TableHeaderColumn>
                        <TableHeaderColumn dataField="username">Name</TableHeaderColumn>
                        <TableHeaderColumn dataField="email">Email</TableHeaderColumn>
                    </BootstrapTable>
                </div>
            )}
        </AuthUserContext.Consumer>
    );
}

const condition = (authUser) => !!authUser;
export default withAuthorization(condition)(withFirebase(Users));