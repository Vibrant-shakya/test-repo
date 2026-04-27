from fastapi import FastAPI, HTTPException
import requests

app = FastAPI()

@app.get("/{username}")
def get_gists(username: str):
    # Call GitHub API
    url = f"https://api.github.com/users/{username}/gists"
    response = requests.get(url)
    
    if response.status_code == 404:
        raise HTTPException(status_code=404, detail="User not found")
    
    if response.status_code != 200:
        raise HTTPException(status_code=response.status_code, detail="GitHub API error")

    return response.json()

if __name__ == "__main__":
    import uvicorn
    # The exercise requires port 8080
    uvicorn.run(app, host="0.0.0.0", port=8080)