import React, { Component } from 'react'
import Grid from '@material-ui/core/Grid'
import LocationClimate from './LocationClimate'
import Repository from '../repositories/Dashboard'

export default class extends Component {
  constructor (props) {
    super(props)

    this._repository = new Repository(props.apiUrl)

    this.state = {
      locations: []
    }
  }

  componentDidMount () {
    setInterval(() => this._updateValues(), 1000)
    setTimeout(() => this._updateValues(), 100)
  }

  _updateValues () {
    if (!this._repository.locationClimate) return

    this.setState({ locations: Object.keys(this._repository.locationClimate) })
  }

  generateLocationClimateCards () {
    const locationClimateCards = []

    for (const location of this.state.locations) {
      locationClimateCards.push(
        <Grid item xs={12} sm={6} lg={4} xl={3}>
          <LocationClimate locationId={location} repository={this._repository} />
        </Grid>
      )
    }

    return locationClimateCards
  }

  render () {
    return <div>
      <Grid container spacing={0} style={{ padding: '24px' }}>
        {this.generateLocationClimateCards()}
      </Grid>
    </div>
  }
}