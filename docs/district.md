# district 地区

    request:
    get /districts/:id/subdistricts(china: 100000)

    response:
    200 OK
    {
      "data": [
        {
          "id": "310230",
          "type": "districts",
          "attributes": {
            "name": "崇明县"
          }
        },
        {
          "id": "310120",
          "type": "districts",
          "attributes": {
            "name": "奉贤区"
          }
        },
        {
          "id": "310118",
          "type": "districts",
          "attributes": {
            "name": "青浦区"
          }
        }
      ]
    }
