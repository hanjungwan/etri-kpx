<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="popUp">
	<!----//wrapper----->
	<div class="pop_wrap">
    				
		<div class="pop_contain">
			<!---//search---->
			<div class="select_wrap">
				<table class="tb2" style="width: 100%;height: 100%;">
					<tbody>
						<c:forEach var="item" items="${results}" varStatus="status">
							<tr>
								<td style="width: 100%;cursor: pointer;" align="center"
									onclick="itemSelect('${item.id}','${item.nm}','${idInput}','${nmInput}');">
									<c:out value="${item.nm}"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<input id="popNm" type="hidden" value=""/>