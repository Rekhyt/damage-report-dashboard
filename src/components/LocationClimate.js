import React, { Component } from 'react'
import { Card, CardContent, CardHeader } from '@material-ui/core'
import Typography from '@material-ui/core/Typography'
import Icon from '@mdi/react'
import { mdiThermometerLines } from '@mdi/js'

export default class extends Component {
  constructor (props) {
    super(props)

    this._repository = props.repository
    this._locationId = props.locationId

    this.state = {
      locationName: props.locationId,
      temperature: 0,
      humidity: 0
    }
  }

  componentDidMount () {
    setInterval(() => this._updateValues(), 1000)
    setTimeout(() => this._updateValues(), 100)
  }

  _updateValues () {
    if (!this._repository.locationClimate || !this._repository.locationClimate[this._locationId]) return

    this.setState({
      locationName: this._repository.locationClimate[this._locationId].locationName,
      temperature: this._repository.locationClimate[this._locationId].temperature,
      humidity: this._repository.locationClimate[this._locationId].humidity
    })
  }

  render () {
    return (<div>
      <Card>
        <CardHeader
          avatar={<Icon path={mdiThermometerLines} style={{ fill: 'white', width: 45, height: 45 }}/>}
          title={<Typography variant={'h3'}>{this.state.locationName}</Typography>}
        />
        <CardContent style={{ textAlign: 'center' }}>
          <Typography gutterBottom variant={'h4'}>
            {this.state.temperature} °C
          </Typography>
          <Typography gutterBottom variant={'h4'}>
            {this.state.humidity} %
          </Typography>
        </CardContent>
      </Card>
    </div>)
  }
}