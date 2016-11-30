<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 우편번호 검색 -->
<div class="popUp" title="우편번호 조회">
	<!----//wrapper----->
	<div class="pop_wrap">
    				
		<div class="pop_contain">
			<!---//search---->
			<div class="select_wrap">
				<form name="zipCodeSearchPopUp" id="zipCodeSearchPopUp" method="post" action="">
					<div class="form-group">
            						<table class="tb1">
            						<tr>
            							<th>검색어 (시군구명)</th>
            							<td>
            								<input type="text" name="keyword" id="keyword" size="75" value="" />
            							</td>
            						</tr>
            						</table>
						<div class="bn"><a href="javascript:;" onclick="" name="zipCodeSearch" id="zipCodeSearch" class="btn_big"><img src="/images/img/ico_magnifier.png">검색</a></div>
					</div>
				</form>
			</div>
			
		</div>
	             
		<!---//table---->
		<div class="row">
			<div class="tb_y_wrap" style="margin: 30px 0 30px 15px;">
				<table id="zipCodeResultLst"></table>
				<div id="zipCodeResultListPager"></div>
			</div>
		</div>
		<!---table//---->
		
	</div>
</div>