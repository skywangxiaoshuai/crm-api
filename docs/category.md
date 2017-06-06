# category 类别

    request:
    get /categories/:id/subcategories(全部类别: 100000)

    response:
    200 OK

    {
    "data": [
      {
        "id": "110001",
        "type": "categories",
        "attributes": {
          "name": "K歌"
        }
      },
      {
        "id": "120001",
        "type": "categories",
        "attributes": {
          "name": "休闲娱乐"
        }
      }
    ]
  }
