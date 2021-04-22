import { Button } from "react-bootstrap";
import React from "react";
import { withFirebase } from './../Firebase';

const SignOutButton = ({ firebase }) => {

    return (
        <div>
            <Button href="/login" onClick={firebase.doSignOut}>
                Sign Out
            </Button>
        </div>
    )
}
export default withFirebase(SignOutButton);
