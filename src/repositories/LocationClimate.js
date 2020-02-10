import request from 'request-promise-native'

export default class {
  constructor (apiUrl) {
    this._apiUrl = apiUrl
    this._data = {}

    setInterval(() => this._fetchFromApi(), 10000)
    this._fetchFromApi()
      .catch(err => console.error(err))
  }

  async _fetchFromApi () {
    this._data = await request({
      url: this._apiUrl + '/dashboard',
      method: 'get',
      json: true
    })
  }

  get data () {
    return this._data
  }
}