document.addEventListener("DOMContentLoaded", function () {
    const userList = document.getElementById("user-list");
    const taskList = document.getElementById("task-list");
    const addTaskForm = document.getElementById("add-task-form");

    fetch("api.php")
        .then(response => response.json())
        .then(users => {
            userList.innerHTML = "<h2>User List</h2>";
            users.forEach(user => {
                const userDiv = document.createElement("div");
                userDiv.innerHTML = `<strong>${user.username}</strong> (${user.role})<br><img src="uploads/${user.photo_path}" width="50" height="50">`;
                userList.appendChild(userDiv);
            });
        });

    fetch("api.php")
        .then(response => response.json())
        .then(tasks => {
            taskList.innerHTML = "<h2>Task List</h2>";
            tasks.forEach(task => {
                const taskDiv = document.createElement("div");
                taskDiv.classList.add("task");
                taskDiv.innerHTML = `<div><strong>${task.title}</strong><br>${task.description}</div>
                    <div>
                        <select data-task-id="${task.id}">
                            <option value="todo" ${task.status === 'todo' ? 'selected' : ''}>To Do</option>
                            <option value="in_progress" ${task.status === 'in_progress' ? 'selected' : ''}>In Progress</option>
                            <option value="done" ${task.status === 'done' ? 'selected' : ''}>Done</option>
                        </select>
                        <button data-task-id="${task.id}">Delete</button>
                    </div>`;
                taskList.appendChild(taskDiv);
            });
        });

   
    addTaskForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const title = document.getElementById("title").value;
        const description = document.getElementById("description").value;

        fetch("api.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                // Заменить на реальный "user_id" пользователя 
                user_id: 1, 
                title: title,
                description: description,
            }),
        })
            .then(response => response.json())
            .then(data => {
                alert(data.message);
                location.reload();
            });
    });

    taskList.addEventListener("change", function (e) {
        if (e.target.tagName === "SELECT") {
            const taskId = e.target.getAttribute("data-task-id");
            const status = e.target.value;

            fetch("api.php", {
                method: "PUT",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: `task_id=${taskId}&status=${status}`,
            })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                    location.reload();
                });
        }
    });

    taskList.addEventListener("click", function (e) {
        if (e.target.tagName === "BUTTON") {
            const taskId = e.target.getAttribute("data-task-id");

            fetch("api.php", {
                method: "DELETE",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                body: `task_id=${taskId}`,
            })
                .then(response => response.json())
                .then(data => {
                    alert(data.message);
                    location.reload();
                });
        }
    });
});
