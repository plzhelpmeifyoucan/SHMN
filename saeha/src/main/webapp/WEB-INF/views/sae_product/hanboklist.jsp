<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<body>
	<%@include file='../include/nav.jsp'%>
	<div class="page-content">
		<div style="width: 90%">
			<div style="padding: 60px 0; height: 100%;">
				<div class="section-heading">
					<h1>
						Saeha Shop<br> <em>Hanbok</em>
					</h1>
					<p>
						굿즈보러가기 <br>한복 보러가기
					</p>
				</div>
				<div class="row tm-row">
					<div class="col-12">
						<form method="GET" class="form-inline tm-mb-80 tm-search-form">
							<input class="form-control tm-search-input" name="keyword"
								id="keywordInput" value="${srci.keyword}" type="text"
								placeholder="Search..." aria-label="Search">
							<button class="tm-search-button" id="searchBtn" type="button">
								검색</button>
						</form>
					</div>
				</div>
				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "hanboklist"
											+ '${hpageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());
								});
					});
				</script>


				<form role="form" method="get">

					<c:forEach items="${hanboklist }" var="hanboklist">
						<article class="col-12 col-md-6 tm-post">
							<hr class="tm-hr-primary">
							<input value="<c:out value="${hanboklist.pd_bno }" />"
								type="hidden"> <a href="post.html"
								class="effect-lily tm-post-link tm-pt-60">

								<div class="tm-post-link-inner">
									<a
										href="/sae_product/read?pd_bno=${hanboklist.pd_bno}&pd_type=${hanboklist.pd_type}&page=${scri.page}&perPageNum=${scri.perPageNum}
									&searchType=${scri.searchType }&keyword=${srci.keyword }">
										<img src="/resources/productimg/${hanboklist.p_filepath }" />
									</a>
								</div>
								<h2 class="tm-pt-30 tm-color-primary tm-post-title">
									<c:out value="${hanboklist.pd_name}" />
								</h2>
							</a>
							<p class="tm-pt-30">
								<fmt:formatDate value="${hanboklist.pd_date}"
									pattern="yyyy-MM-dd" />
							</p>
							<div class="d-flex justify-content-between tm-pt-45">
								<span class="tm-color-primary"> <c:out
										value="${hanboklist.pd_price }" /> 원
								</span>
							</div>
							<hr>

							<div class="d-flex justify-content-between">
								<span><c:out value="${hanboklist.pd_readcount }" /> read</span>
								<span>by people</span>
							</div>
						</article>
					</c:forEach>


					<div class="row tm-row tm-mt-100 tm-mb-75">
						<div class="tm-prev-next-wrapper">
							<a
								href="hanboklist${hpageMaker.makeSearch(hpageMaker.startPage - 1)}"
								class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
							<a
								href="hanboklist${hpageMaker.makeSearch(hpageMaker.endPage + 1 )}"
								class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
						</div>
						<div class="tm-paging-wrapper">
							<span class="d-inline-block mr-3">Page</span>
							<nav class="tm-paging-nav d-inline-block">
								<ul>
									<c:forEach begin="${gpageMaker.startPage}"
										end="${gpageMaker.endPage}" var="idx">
										<li class="tm-paging-item active"><a
											href="hanboklist${hpageMaker.makeSearch(idx)}"
											class="mb-2 tm-btn tm-paging-link">${idx}</a></li>
									</c:forEach>
								</ul>
							</nav>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; 2019 Company Name . Design: TemplateMo</p>
	</footer>
</body>
</html>