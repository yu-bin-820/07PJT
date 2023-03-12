<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////

<%@ page import="java.util.*" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.common.util.*" %>
<%
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> 	/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>


<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
function fncGetProductList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="/product/listProduct?menu=search" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
							��ǰ ��� ��ȸ
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
			<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
			/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<%--<input 	type="text" name="searchKeyword" value="<%= searchKeyword %>"  class="ct_input_g" 
							style="width:200px; height:20px" >--%>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 				
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('${search.currentPage }');">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
		<%--
		<td colspan="11" >
		��ü  <%= resultPage.getTotalCount() %> �Ǽ�,	���� <%= resultPage.getCurrentPage() %> ������
		</td>
		--%>
		<td colspan="11" >
			��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage }  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
	<%
			for(int i=0; i<list.size(); i++) {
				Product product = (Product)list.get(i);
				//PurchaseVO purvo ;
		%>
				<%  if(role.equals("admin")){ %>
		<tr class="ct_list_pop">
			<td align="center"><%=i+1%></td>
			<td></td>
			<td align="left">
				<a href="/getProduct.do?prodNo=<%=product.getProdNo() %>"><%= product.getProdName() %></a>
			</td>
			<td></td>
			<td align="left"><%= product.getPrice() %></td>
			<td></td>
			<td align="left"><%= product.getRegDate() %></td>
			<td></td>
			<td align="left">
			<%if(product.getProTranCode().equals("0")||product.getProTranCode().equals("")||product.getProTranCode()==null){ %>
			�Ǹ���
			<%} else if(product.getProTranCode().equals("1")) {%>
				���ſϷ�
			<%} else if(product.getProTranCode().equals("2")) {%>
				�����
			<%} else if(product.getProTranCode().equals("3")) {%>
				��ۿϷ�
			<%} %>
				
			</td>		
		</tr>
		<tr>
			<%} else { %>
				<tr class="ct_list_pop">
			<td align="center"><%=i+1%></td>
			<td></td>
			<td align="left">
				<%if(product.getProTranCode().equals("0")||product.getProTranCode()==null){ %>
				<a href="/getProduct.do?prodNo=<%=product.getProdNo() %>"><%= product.getProdName() %></a>
				<%} else { %>
				<%= product.getProdName() %>
				<%} %>
			</td>
			<td></td>
			<td align="left"><%= product.getPrice() %></td>
			<td></td>
			<td align="left"><%= product.getRegDate() %></td>
			<td></td>
			<td align="left">
			<%if(product.getProTranCode().equals("0")||product.getProTranCode()==null){ %>
			�Ǹ���
			<%} else {%>

				��� ����
				<%} %>
		</td>	
	</tr>
	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<%} %>	
<%} %>	
</table>
/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
	<c:if test="${user.role== 'admin'}">
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
			<tr class="ct_list_pop">
				<td align="center">${i}</td>
				<td></td>
				<td align="left">
					<a href="/getProduct.do?prodNo=${product.prodNo}">${product.prodName}</a>
				</td>
				<td></td>
				<td align="left">${product.price}</td>
				<td></td>
				<td align="left">${product.regDate}</td>
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test= "${product.proTranCode=='0'||product.proTranCode==null}">
							�Ǹ���
						</c:when>
						<c:when test= "${product.proTranCode=='1'}">
							���ſϷ� 	
						</c:when>
						<c:when test= "${product.proTranCode=='2' }">
							�����
						</c:when>
						<c:when test= "${product.proTranCode=='3'}">
							��ۿϷ�
						</c:when>
					</c:choose>
				</td>		
			</tr>
			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>	
		</c:forEach>	
	</c:if>	
		
	<c:if test="${user.role== 'user'}">
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i+1}"/>
			<tr class="ct_list_pop">
				<td align="center">${i}</td>
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test= "${product.proTranCode=='0'|| product.proTranCode==null}">
							<a href="/getProduct.do?prodNo=${product.prodNo}">${ product.prodName}</a>
						</c:when>
						<c:otherwise>
								${ product.prodName}
						</c:otherwise>
					</c:choose>
				</td>
				<td></td>
				<td align="left">${ product.price}</td>
				<td></td>
				<td align="left">${ product.regDate}</td>
				<td></td>
				<td align="left">
					<c:choose>
						<c:when test= "${product.proTranCode=='0'||product.proTranCode==null}">
							�Ǹ���
						</c:when>
						<c:otherwise>
							��� ����
						</c:otherwise>
					</c:choose>
				</td>		
			</tr>
			<tr>
				<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			</tr>	
		</c:forEach>	
	</c:if>	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
			
					<jsp:include page="../common/pageNavigatorProduct.jsp"/>	
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>

</body>

</html>


