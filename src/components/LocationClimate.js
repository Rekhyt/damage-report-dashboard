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
      locationName: props.locationName,
      temperature: 0,
      humidity: 0
    }
  }

  componentDidMount () {
    setInterval(() => this._updateValues(), 1000)
    setTimeout(() => this._updateValues(), 100)
  }

  _updateValues () {
    const data = { ...this._repository.data }

    if (!data[this._locationId]) return

    this.setState({ temperature: data[this._locationId].temperature, humidity: data[this._locationId].humidity })
  }

  render () {
    return (<div>
      <Card>
        <CardHeader
          avatar={<Icon path={mdiThermometerLines} style={{ width: 45, height: 45 }}/>}
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