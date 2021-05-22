import React from 'react';

const Dashboard = React.lazy(() => import('./views/pages/Dashboard/Dashboard'));
const Login = React.lazy(() => import('./views/pages/login/Login'));
const Users = React.lazy(() => import('./views/pages/Users/Users'));

const routes = [
  { path: '/', exact: true, name: 'Home' },
  { path: '/dashboard',exact: true, name: 'Dashboard', component: Dashboard },
  { path: '/users', exact: true, name: 'Users', component: Users },
  { path: '/settings', exact: true, name: 'Settings' },
  { path: '/login', exact: true, name: 'Logout', component: Login },
];

export default routes;
