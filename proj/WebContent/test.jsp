<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function warnEmpty() {
		alert("Enter a Input!!");
	}
	function dateToString(date) {
		const dateString = date.toISOString();
		const dateToString = dateString.substring(0, 10) + " " + dateString.substring(11, 19);
		return dateToString;
	}
	function submitComment() {
		const newcommentEL = document.getElementById("new-comment");
		const newcomment = newcommentEL.value.trim();

		if (newcomment) {
			const dateEL = document.createElement("div");
			dateEL.classList.add("comment-date");
			const dateString = dateToString(new Date());
			dateEL.innerText = dateString;

			const contentEL = document.createElement("div");
			contentEL.classList.add("comment-content");
			contentEL.innerText = newcomment;

			const commentEL = document.createElement("div");
			commentEL.classList.add("comment-row");
			commentEL.appendChild(dateEL);
			commentEL.appendChild(contentEL);

			document.getElementById("comments").appendChild(commentEL);
			newcommentEL.value = "";

			const countEL = document.getElementById("comments-count");
			const count = countEL.innerText;
			countEL.innerText = parseInt(count) + 1;
		} else
			warnEmpty();
	}
</script>
</head>
<body>
	<div id="comments">
		<div id="comment-head" class="comment-row">
			<span id="comments-count">2</span> Comment(s)
		</div>
		<div class="comment-row">
			<textarea id="new-comment" name="new_comment" rows="5"
				placeholder="New Comment"></textarea>
			<button type="submit" onclick="submitComment()">submit</button>
		</div>
		<div class="comment-row">
			<div class="comment-date">2020-05-20</div>
			<div class="comment-content">test1</div>
		</div>
		<div class="comment-row">
			<div class="comment-date">2020-05-26</div>
			<div class="comment-content">test2</div>
		</div>
	</div>
</body>
</html>