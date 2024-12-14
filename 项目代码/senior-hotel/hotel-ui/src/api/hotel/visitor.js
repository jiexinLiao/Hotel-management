import request from '@/utils/request'

// 查询游客列表
export function listVisitor(query) {
  return request({
    url: '/hotel/visitor/list',
    method: 'get',
    params: query
  })
}

// 查询游客详细
export function getVisitor(visitorId) {
  return request({
    url: '/hotel/visitor/' + visitorId,
    method: 'get'
  })
}

// 新增游客
export function addVisitor(data) {
  return request({
    url: '/hotel/visitor',
    method: 'post',
    data: data
  })
}

// 修改游客
export function updateVisitor(data) {
  return request({
    url: '/hotel/visitor',
    method: 'put',
    data: data
  })
}

// 删除游客
export function delVisitor(visitorId) {
  return request({
    url: '/hotel/visitor/' + visitorId,
    method: 'delete'
  })
}
