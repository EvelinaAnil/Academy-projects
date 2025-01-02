document.addEventListener("DOMContentLoaded", function() {
    const messageList = document.getElementById("message-list");
    const messageText = document.getElementById("message-text");
    const addMessageBtn = document.getElementById("add-message");

    function fetchMessages() {
        fetch("api.php")
            .then(response => response.json())
            .then(data => {
                messageList.innerHTML = "";
                data.messages.forEach(message => {
                    const messageElement = document.createElement("div");
                    messageElement.textContent = message.text;
                    messageList.appendChild(messageElement);
                });
            });
    }

    addMessageBtn.addEventListener("click", function() {
        const text = messageText.value;
        if (text.trim() !== "") {
            fetch("api.php", {
                method: "POST",
                body: new URLSearchParams({ text: text }),
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    fetchMessages(); 
                    messageText.value = ""; 
                } else {
                    alert("Ошибка при добавлении сообщения.");
                }
            });
        }
    });

   
    fetchMessages();
});
