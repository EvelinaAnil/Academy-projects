// ...

// Получение данных пользователя
fetch("api.php?get_user_info=1")
    .then(response => response.json())
    .then(data => {
        if (data.user) {
            renderUserInfo(data.user);
        }
    });

// ...

function renderUserInfo(user) {
    const userInfoContainer = document.getElementById("user-info");
    userInfoContainer.innerHTML = `<p>Имя пользователя: ${user.username}</p>`;
}

// ...

