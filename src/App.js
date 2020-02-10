import React from 'react'
import './App.css'
import CssBaseline from '@material-ui/core/CssBaseline'
import NavBar from './components/NavBar'
import Dashboard from './components/Dashboard'

function App () {
  return (
    <div>
      <CssBaseline />
      <NavBar />
      <Dashboard />
    </div>
  )
}

export default App
