import request from '@/utils/request'

// 查询酒店新闻中心列表
export function listNews(query) {
  return request({
    url: '/hotel/news/list',
    method: 'get',
    params: query
  })
}

// 查询酒店新闻中心详细
export function getNews(newsId) {
  return request({
    url: '/hotel/news/' + newsId,
    method: 'get'
  })
}

// 新增酒店新闻中心
export function addNews(data) {
  return request({
    url: '/hotel/news',
    method: 'post',
    data: data
  })
}

// 修改酒店新闻中心
export function updateNews(data) {
  return request({
    url: '/hotel/news',
    method: 'put',
    data: data
  })
}

// 删除酒店新闻中心
export function delNews(newsId) {
  return request({
    url: '/hotel/news/' + newsId,
    method: 'delete'
  })
}
