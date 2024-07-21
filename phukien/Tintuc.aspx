<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tintuc.aspx.cs" Inherits="phukien.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .chat-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
        }

        .messages {
            height: 300px;
            overflow-y: auto;
            border-bottom: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .message {
            margin: 10px 0;
        }

        .user-message {
            text-align: right;
        }

        .bot-message {
            text-align: left;
        }

        .input-container {
            display: flex;
        }

        .input-container input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .input-container button {
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: white;
        }
    </style>

    <h1>Tin tức Công nghệ</h1>
    <div class="news-list">
        <asp:ListView ID="lvTechNews" runat="server">
            <ItemTemplate>
                <div class="news-article">
                    <div class="news-image">
                        <img src='<%# Eval("ImageUrl") %>' alt="Hình ảnh tin tức" />
                    </div>
                    <div class="news-content">
                        <div class="news-title"><%# Eval("Title") %></div>
                        <div><%# Eval("Content") %></div>
                        <div class="news-date">Đăng vào <%# Eval("DatePosted", "{0:MM/dd/yyyy}") %></div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <div class="chat-container">
        <div class="messages" id="messages"></div>
        <div class="input-container">
            <input type="text" id="userInput" placeholder="Nhập tin nhắn của bạn..." />
            <button onclick="sendMessage()">Gửi</button>
        </div>
    </div>

    <script>
        async function sendMessage() {
            const userInput = document.getElementById('userInput').value;
            if (userInput.trim() === '') return;

            addMessage(userInput, 'user-message');

            const response = await fetch('/api/ChatGPT/SendMessage', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ Content: userInput })
            });

            if (response.ok) {
                const result = await response.json();
                const botMessage = JSON.parse(result).choices[0].text.trim();
                addMessage(botMessage, 'bot-message');
            } else {
                addMessage('Có lỗi xảy ra khi kết nối với OpenAI.', 'bot-message');
            }

            document.getElementById('userInput').value = '';
        }

        function addMessage(message, className) {
            const messages = document.getElementById('messages');
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${className}`;
            messageDiv.innerText = message;
            messages.appendChild(messageDiv);
            messages.scrollTop = messages.scrollHeight;
        }
    </script>
</asp:Content>
