# 交易流水

## 筛选流水

    登录 +,

    request:

    根据商铺名字和日期筛选:
    get /trades?store_id=1&start_date=2017-04-01&end_date=2017-04-24&page[number]=1

    根据日期筛选交易流水
    get /trades?start_date=2017-04-01&end_date=2017-04-24&page[number]=1

    response:

    200 ok

    {
      "data": [
        {
          "id": "1",
          "type": "trades",
          "attributes": {
            "service-name": "111",
            "store-name": "aaa",
            "date": "2017-04-24",
            "trade-num": 99999,
            "trade-sum": 123456789.1
          }
        },
        {
          "id": "3",
          "type": "trades",
          "attributes": {
            "service-name": "111",
            "store-name": "aaa",
            "date": "2017-04-23",
            "trade-num": 99999,
            "trade-sum": 123456789.1
          }
        }
      ],
      "links": {
        "self": "http://192.168.0.23:3000/trades?end_date=2017-04-24&page%5Bnumber%5D=1&page%5Bsize%5D=2&start_date=2017-04-01",
        "next": "http://192.168.0.23:3000/trades?end_date=2017-04-24&page%5Bnumber%5D=2&page%5Bsize%5D=2&start_date=2017-04-01",
        "last": "http://192.168.0.23:3000/trades?end_date=2017-04-24&page%5Bnumber%5D=3&page%5Bsize%5D=2&start_date=2017-04-01"
      },
      "meta": {
        "total-count": 5
      }
    }
