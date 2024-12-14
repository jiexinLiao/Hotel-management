import request from '@/utils/request'

// 查询酒店预约列表
export function listBook(query) {
  return request({
    url: '/hotel/book/list',
    method: 'get',
    params: query
  })
}

// 查询酒店预约详细
export function getBook(bookId) {
  return request({
    url: '/hotel/book/' + bookId,
    method: 'get'
  })
}

// 新增酒店预约
export function addBook(data) {
  return request({
    url: '/hotel/book',
    method: 'post',
    data: data
  })
}

// 修改酒店预约
export function updateBook(data) {
  return request({
    url: '/hotel/book',
    method: 'put',
    data: data
  })
}

// 删除酒店预约
export function delBook(bookId) {
  return request({
    url: '/hotel/book/' + bookId,
    method: 'delete'
  })
}

// 办理入住
export function moveIn(bookId) {
  return request({
    url: '/hotel/book/moveIn?bookId=' + bookId,
    method: 'get'
  })
}

// 办理离开
export function moveOut(bookId) {
  return request({
    url: '/hotel/book/moveOut?bookId=' + bookId,
    method: 'get'
  })
}
