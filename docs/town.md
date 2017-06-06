# block所属的城镇街道

## 根据名字模糊查询城镇街道

    登录 +，

    request:

    get /towns?q=南京  //  带着参数就根据参数模糊查询， 不带参数则返回所有的城镇街道

    response:

    200 ok

    {
      "data": [
        {
          "id": "1",
          "type": "towns",
          "attributes": {
            "name": "南京东路街道"
          }
        },
        {
          "id": "36",
          "type": "towns",
          "attributes": {
            "name": "南京西路街道"
          }
        }
      ]
    }
