function checkForm() {
    var id = document.getElementById("id");
    var name = document.getElementById("name");
    var price = document.getElementById("price");

    if (id.value.trim() == "") {
        alert("맛집 ID를 입력하세요.");
        id.focus();
        return false;
    }
    if (name.value.trim() == "") {
        alert("상호명을 입력하세요.");
        name.focus();
        return false;
    }
    // 가격이 숫자인지 확인 (isNaN 활용)
    if (isNaN(price.value) || price.value == "") {
        alert("금액은 숫자만 입력 가능합니다.");
        price.select();
        return false;
    }

    document.newRest.submit();
}