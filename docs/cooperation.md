# Cooperation 商铺与服务之间的关系表

## 返回一个商铺所有的服务关系表

    登录 +,

    request:

    get /stores/:id/cooperations?page[number]=1

    response:

    200 ok

    {
      "data": [
        {
          "id": "3",
          "type": "cooperations",
          "attributes": {
            "start-date": "2017-04-20",
            "status": 0,
            "remarks": "测试更新这里是备注",
            "service-name": "111",
            "service_id": 1000
          }
        },
        {
          "id": "4",
          "type": "cooperations",
          "attributes": {
            "start-date": "2017-04-20",
            "status": 0,
            "remarks": "测试更新这里是备注",
            "service-name": "111",
            "service_id": 1000
          }
        }
      ],
      "links": {
        "self": "http://192.168.0.23:3000/stores/1/cooperations?page%5Bnumber%5D=1&page%5Bsize%5D=2",
        "next": "http://192.168.0.23:3000/stores/1/cooperations?page%5Bnumber%5D=2&page%5Bsize%5D=2",
        "last": "http://192.168.0.23:3000/stores/1/cooperations?page%5Bnumber%5D=2&page%5Bsize%5D=2"
      },
      "meta": {
        "total-count": 4
      }
    }

## 创建商铺与服务之间的关系

    登录 +,

    request:

    post /stores/:id/cooperations

    {
      "data": {
        "type": "cooperations",
        "attributes": {
        "service_id": 10,
        "start_date": "2017-04-20",
        "status": 0,
        "remarks": "测试更新这里是备注"
        }
      }
    }

    response:

    201 created, 422 unprocessable_entity  

    // 创建成功
    {
      "data": {
        "id": "2",
        "type": "cooperations",
        "attributes": {
          "start-date": "2017-04-20",
          "status": 0,
          "remarks": "测试更新这里是备注",
          "service_name": "这是服务名称",
          "service_id": 10
        }
      }
    }

    // 如果该商铺已经添加过相同的服务，就不能再次添加

    {
      "errors": [
        {
          "source": {
            "pointer": "/data/attributes/base"
          },
          "detail": "该商铺已经在使用同样的服务，请不要重复添加！！！"
        }
      ]
    }

## 编辑更新商铺与服务之间的关系

    登录 + ,

    request:

    get /cooperations/:id/edit

    response:

    200 ok, 404 not_found

    {
      "data": {
        "id": "8",
        "type": "cooperations",
        "attributes": {
          "start-date": "2017-04-20",
          "status": 0,
          "remarks": "测试更新这里是备注",
          "service-name": "111",
          "service_id": 10
        }
      }
    }

    request:

    put /cooperations/:id

    {
      "data": {
        "type": "cooperations",
        "attributes": {
        "service_id": 10,
        "start_date": "2017-04-20",
        "status": 0,
        "remarks": "测试更新这里是备注"
        }
      }
    }

    response:

    200 ok, 422 unprocessable_entity

    {
      "data": [
        {
          "id": "1",
          "type": "cooperations",
          "attributes": {
            "start-date": "2017-04-20",
            "status": 0,
            "remarks": "测试更新这里是备注",
            "service_name": "这是服务名称",
            "service_id": 10
          }
        }
      ]
    }


## 删除商铺与服务之间的关系

    登录 +,

    request:

    DELETE /cooperations/:id

    response

    204 no_content
