import request from '@/utils/request'

// 查询酒店房间类型列表
export function listType(query) {
  return request({
    url: '/hotel/type/list',
    method: 'get',
    params: query
  })
}

// 查询酒店房间类型详细
export function getType(roomTypeId) {
  return request({
    url: '/hotel/type/' + roomTypeId,
    method: 'get'
  })
}

// 新增酒店房间类型
export function addType(data) {
  return request({
    url: '/hotel/type',
    method: 'post',
    data: data
  })
}

// 修改酒店房间类型
export function updateType(data) {
  return request({
    url: '/hotel/type',
    method: 'put',
    data: data
  })
}

// 删除酒店房间类型
export function delType(roomTypeId) {
  return request({
    url: '/hotel/type/' + roomTypeId,
    method: 'delete'
  })
}
