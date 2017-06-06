# Picture 图片

## 添加商铺图片

    登录: +

    request:

    post /stores/:store_id/pictures

    {
      "data": {
        "type": "pictures",
        "attributes": {
    	    "picture": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgA......"
        }
      }
    }

    response:

    201 created, 422 unprocessable_entity

    {
      "data": {
        "id": "6",
        "type": "pictures",
        "attributes": {
          "url": "/system/pictures/6/pictures/s.jpg?1491978634"
        }
      }
    }

## 添加商铺图片

    登录: +

    request:

    post /enterprises/:enterprise_id/pictures

    {
      "data": {
        "type": "pictures",
        "attributes": {
    	    "picture": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgA......"
        }
      }
    }

    response:

    201 created, 422 unprocessable_entity

    {
      "data": {
        "id": "6",
        "type": "pictures",
        "attributes": {
          "url": "/system/pictures/6/pictures/s.jpg?1491978634"
        }
      }
    }

## 删除图片

    request:

    delete /pictures/:id

    response:

    204 no_content
