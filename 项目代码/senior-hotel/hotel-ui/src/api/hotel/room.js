import request from '@/utils/request'

// 查询酒店房间列表
export function listRoom(query) {
  return request({
    url: '/hotel/room/list',
    method: 'get',
    params: query
  })
}

// 查询酒店房间详细
export function getRoom(roomId) {
  return request({
    url: '/hotel/room/' + roomId,
    method: 'get'
  })
}

// 新增酒店房间
export function addRoom(data) {
  return request({
    url: '/hotel/room',
    method: 'post',
    data: data
  })
}

// 修改酒店房间
export function updateRoom(data) {
  return request({
    url: '/hotel/room',
    method: 'put',
    data: data
  })
}

// 删除酒店房间
export function delRoom(roomId) {
  return request({
    url: '/hotel/room/' + roomId,
    method: 'delete'
  })
}
