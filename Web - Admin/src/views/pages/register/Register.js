import React, { useState } from "react";
import { Link } from 'react-router-dom'
import {
  CButton,
  CCard,
  CCardBody,
  CCardFooter,
  CCol,
  CContainer,
  CForm,
  CInput,
  CInputGroup,
  CInputGroupPrepend,
  CInputGroupText,
  CRow
} from '@coreui/react'
import CIcon from '@coreui/icons-react'

const Register = (props) => {

  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [passwordOne, setPasswordOne] = useState("");
  const [passwordTwo, setPasswordTwo] = useState("");
  const [error, setError] = useState(null);

  function onSubmit(event) {
    props.firebase
      .doCreateUserWithEmailAndPassword(email, passwordOne)
      .then((authUser) => {
        return props.firebase.user(authUser.user.uid).set({
          username,
          email,
        });
      })
      .then(() => {
        setUsername("");
        setEmail("");
        setPasswordOne("");
        setPasswordTwo("");
        setError(null);
        props.history.push('/dashboard');
      })
      .catch((error) => {
        setError(error);
      });
    event.preventDefault();
  }

  function onChange(event) {
    switch (event.target.name) {
      case "username":
        setUsername(event.target.value);
        break;
      case "email":
        setEmail(event.target.value);
        break;
      case "passwordOne":
        setPasswordOne(event.target.value);
        break;
      case "passwordTwo":
        setPasswordTwo(event.target.value);
        break;
      default:
        return;
    }
  }

  function isInvalid() {
    return (
      passwordOne !== passwordTwo ||
      passwordOne === "" ||
      email === "" ||
      username === ""
    );
  }


  return (
    <div className="c-app c-default-layout flex-row align-items-center">
      <CContainer>
        <CRow className="justify-content-center">
          <CCol md="9" lg="7" xl="6">
            <CCard className="mx-4">
              <CCardBody className="p-4">
                <CForm onSubmit={onSubmit}>
                  <h1>Register</h1>
                  <p className="text-muted">Create your account</p>
                  <CInputGroup className="mb-3">
                    <CInputGroupPrepend>
                      <CInputGroupText>
                        <CIcon name="cil-user" />
                      </CInputGroupText>
                    </CInputGroupPrepend>
                    <CInput
                      name="username"
                      value={username}
                      onChange={onChange}
                      type="text"
                      className="form-control"
                      placeholder="Full Name"
                    />
                  </CInputGroup>
                  <CInputGroup className="mb-3">
                    <CInputGroupPrepend>
                      <CInputGroupText>@</CInputGroupText>
                    </CInputGroupPrepend>
                    <CInput
                      name="email"
                      value={email}
                      onChange={onChange}
                      type="text"
                      className="form-control"
                      placeholder="Email Address"
                    />
                  </CInputGroup>
                  <CInputGroup className="mb-3">
                    <CInputGroupPrepend>
                      <CInputGroupText>
                        <CIcon name="cil-lock-locked" />
                      </CInputGroupText>
                    </CInputGroupPrepend>
                    <CInput
                      name="passwordOne"
                      value={passwordOne}
                      onChange={onChange}
                      type="password"
                      className="form-control"
                      placeholder="Password"
                    />
                  </CInputGroup>
                  <CInputGroup className="mb-4">
                    <CInputGroupPrepend>
                      <CInputGroupText>
                        <CIcon name="cil-lock-locked" />
                      </CInputGroupText>
                    </CInputGroupPrepend>
                    <CInput
                      name="passwordTwo"
                      value={passwordTwo}
                      onChange={onChange}
                      type="password"
                      className="form-control"
                      placeholder="Confirm Password"
                    />
                  </CInputGroup>
                  <CButton disabled={isInvalid()}
                    type="submit" color="success" block>Create Account</CButton>
                </CForm>
              </CCardBody>
              <CCardFooter className="p-4">
                <CRow>
                  <CCol xs="12" sm="6">
                    {error && <p>{error.message}</p>}
                  </CCol>
                </CRow>
                <CRow>
                  <CCol xs="12">
                    <p className="forgot-password text-right">
                      Already registered <Link to='/login'>sign in?</Link>
                    </p>
                  </CCol>
                </CRow>
              </CCardFooter>
            </CCard>
          </CCol>
        </CRow>
      </CContainer>
    </div>
  )
}

export default Register
