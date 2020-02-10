import React from 'react'
import Grid from '@material-ui/core/Grid'
import LocationClimate from './LocationClimate'
import LocationClimateRepository from '../repositories/LocationClimate'

export default () => {
  return <div>
    <Grid container spacing={2} style={{ padding: '24px' }}>
      <Grid item xs={12} sm={6} lg={4} xl={3}>
        <LocationClimate locationName={'Küche'} locationId={'kitchen'} repository={new LocationClimateRepository('http://localhost:3000')} />
      </Grid>
    </Grid>
  </div>
}