
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Memes Diary</title>
    <style>
     body {
    font-family: 'Comic Sans MS', 'Arial', sans-serif; /* Fun font for a playful vibe */
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #fce38a, #f38181);
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    text-align: center;
}

.container {
    background: #ffffff;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    max-width: 600px;
    width: 90%;
    position: relative;
    text-align: center;
    overflow: hidden;
}

.container:before {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    z-index: -1;
    transform: rotate(-30deg);
    animation: gradient-move 5s infinite linear;
    opacity: 0.2;
    border-radius: 50%;
}

@keyframes gradient-move {
    0% { transform: translate(-30%, -30%) rotate(0deg); }
    100% { transform: translate(30%, 30%) rotate(360deg); }
}

h1 {
    color: #4CAF50;
    font-size: 32px;
    margin-bottom: 20px;
    font-weight: bold;
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    animation: bounce 2s infinite;
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
    40% { transform: translateY(-15px); }
    60% { transform: translateY(-7px); }
}

#meme-title {
    font-size: 22px;
    color: #333;
    margin-bottom: 20px;
    font-weight: bold;
    background: #ffd700;
    padding: 10px;
    border-radius: 10px;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

.arrow {
    position: fixed; /* Fixed position to keep arrows in place */
    top: 50%; /* Vertically centered */
    transform: translateY(-50%);
    font-size: 30px;
    background: #ff4081;
    color: white;
    padding: 15px;
    border-radius: 50%;
    cursor: pointer;
    user-select: none;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
    z-index: 1000; /* Ensure arrows are above everything else */
}

.arrow:hover {
    background-color: #ff80ab;
    transform: scale(1.1);
    box-shadow: 0 7px 20px rgba(0, 0, 0, 0.4);
}

.arrow.left {
    left: 20px; /* Fixed position on the left */
}

.arrow.right {
    right: 20px; /* Fixed position on the right */
}

.arrow:active {
    transform: scale(0.95);
}

footer {
    margin-top: 20px;
    font-size: 14px;
    color: #666;
    text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.5);
    animation: fade-in 2s ease-in;
}

@keyframes fade-in {
    0% { opacity: 0; }
    100% { opacity: 1; }
}
.nav-buttons {
            margin-top: 30px;
            display: flex;
            justify-content: space-around;
            width: 100%;
        }

        .nav-buttons a {
            padding: 12px 25px;
            background-color: #FF5722;
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s, transform 0.2s;
        }

        .nav-buttons a:hover {
            background-color: #FF7043;
            transform: scale(1.05);
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Memes Diary</h1>
        <div id="meme-display">
            <h3 id="meme-title"></h3>
            
        </div>
        <div class="arrow left" onclick="prevMeme()">&#8592;</div>
        <div class="arrow right" onclick="nextMeme()">&#8594;</div>
        <div class="nav-buttons">
            <a href="chat.html">Go to Chat</a>
            <a href="upload_meme.html">Upload Meme</a>
            <a href="index.html">Back to Welcome</a>
        </div>
    </div>

<script>
    const memes = <%= new Gson().toJson(request.getAttribute("memes")) %>;
    let currentIndex = 0;

    function displayMeme(index) {
        if (memes.length > 0) {
            const meme = memes[index];
            document.getElementById("meme-title").textContent = meme.title;
           
        } else {
            document.getElementById("meme-title").textContent = "No memes available";
        
        }
    }

    function prevMeme() {
        if (currentIndex > 0) {
            currentIndex--;
            displayMeme(currentIndex);
        }
    }

    function nextMeme() {
        if (currentIndex < memes.length - 1) {
            currentIndex++;
            displayMeme(currentIndex);
        }
    }

    displayMeme(currentIndex);
</script>
</body>
</html>



