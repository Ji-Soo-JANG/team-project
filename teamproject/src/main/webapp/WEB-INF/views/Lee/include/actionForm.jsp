<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="actionForm" action="/board/community/free" method="get">
	<input id="inputPageNum" type="hidden" name="pageNum" value="${criteria.pageNum}">
	<input id="inputAmount" type="hidden" name="amount" value="${criteria.amount}">
	<input type="hidden" name="type" value="${criteria.type}">
	<input type="hidden" name="keyword" value="${criteria.keyword}">
</form>