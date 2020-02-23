import React from 'react'
import './App.css'
import CssBaseline from '@material-ui/core/CssBaseline'
import MuiThemeProvider from '@material-ui/core/styles/MuiThemeProvider'
import { createMuiTheme } from '@material-ui/core'
import NavBar from './components/NavBar'
import Dashboard from './components/Dashboard'

const theme = createMuiTheme({ palette: { type: 'dark' } })

function App () {
  return (
    <MuiThemeProvider theme={theme}>
      <CssBaseline/>
      <div>
        <NavBar/>
        <Dashboard apiUrl={process.env.REACT_APP_API_URL || 'http://localhost:8000'}/>
      </div>
    </MuiThemeProvider>
  )
}

export default App
