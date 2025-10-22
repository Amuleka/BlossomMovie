# BlossomMovie (SwiftUI • TMDB • YouTube • SwiftData)

This project represents my journey learning how to build a complete iOS app from scratch using **SwiftUI** and **Xcode**.  
Through this process, I learned how to structure a feature-rich **movie & TV browsing app**, design a clean interface, handle asynchronous API calls, and integrate external data sources. I also learned how to embed YouTube trailers directly in the app and use **SwiftData** for persistent storage of downloaded titles.

I used **The Movie Database (TMDB)** API to fetch movies and TV shows by category (trending, top-rated, etc.) and the **YouTube Data API v3** from Google Cloud to display trailers. Building this app gave me hands-on experience with **SwiftUI architecture**, **async/await networking**, **WKWebView integration**, and **modern persistence** using **SwiftData**.

---

## ✨ What I Built & Learned

- Built a **home screen** that lists trending and top-rated Movies and TV shows.
- Created a **search view** that dynamically fetches results as users type.  
- Designed a **detail view** with metadata and an **embedded YouTube trailer** using WKWebView.  
- Implemented a **download manager** with **SwiftData** to save titles locally.  
- Learned to configure **App Transport Security (ATS)** for YouTube and Google APIs.  
- Practiced organizing a Swift project into Models, Networking, Views, and ViewModels.

---

## 🗂 Project Structure

```
BlossomMovie/
├─ Models/
│  ├─ Title.swift
│  ├─ YoutubeSearchResponse.swift
│  ├─ Errors.swift
│  └─ Constants.swift
│
├─ Networking/
│  ├─ DataFetcher.swift
│  └─ APIConfig.swift
│
├─ Views/
│  ├─ HomeView.swift
│  ├─ UpcomingView.swift
│  ├─ SearchView.swift
│  ├─ DownloadView.swift
│  ├─ TitleDetailView.swift
│  ├─ VerticalListView.swift
│  ├─ HorizontalListView.swift
│  └─ ContentView.swift
│
├─ ViewModels/
│  ├─ ViewModel.swift
│  ├─ SearchViewModel.swift
│
├─ Player/
│  └─ YoutubePlayer.swift
│
├─ Assets.xcassets/
│
├─ APIConfig.json             # Local configuration for API keys
└─ BlossomMovieApp.swift      # App entry point
```

This structure helped me understand how to separate logic and UI in SwiftUI apps and made the codebase much easier to navigate.

---

## 🔧 Tools & Technologies I Learned

- **SwiftUI** for declarative UI design  
- **SwiftData** for local persistence  
- **Async/Await** for modern networking  
- **WKWebView** for video playback  
- **The Movie Database (TMDB) API** for content data  
- **YouTube Data API v3** for trailers  
- **App Transport Security (ATS)** configuration for embedded content  

---

## 🔑 Configuration (API keys)

I created an `APIConfig.json` file inside the app bundle to manage API endpoints and keys.

```json
{
  "tmdbBaseURL": "https://api.themoviedb.org/",
  "tmdbAPIKey": "<YOUR_TMDB_KEY>",
  "youtubeBaseURL": "https://www.youtube.com/embed/",
  "youtubeAPIKey": "<YOUR_YOUTUBE_KEY>",
  "youtubeSearchURL": "https://www.googleapis.com/youtube/v3/search"
}
```

This helped me learn how to load external configuration files safely while keeping real keys private.

---

## 🌐 Lessons from WKWebView & YouTube

While integrating YouTube trailers, I learned that not all videos are embeddable due to restrictions like region blocks, age limits, or owner preferences. I added proper error handling and fallback logic to handle this.

I also learned about **App Transport Security (ATS)** and how to whitelist trusted domains like YouTube and Google APIs to make embedded playback work properly on iOS devices.

---

## 🚀 Running the App

```bash
# Open the project
open BlossomMovie.xcodeproj

# Add your APIConfig.json file (see above)

# Run on a real device for best YouTube playback experience
```

---

## 💡 Key Takeaways

- Building this app taught me how to **connect multiple APIs**, manage data flow, and organize an app at scale.  
- I became much more confident working with **SwiftUI, async/await, and SwiftData**.  
- Debugging YouTube embedding issues helped me understand **network permissions, ATS rules, and WKWebView configuration** in depth.  
- Structuring the project into folders clarified how professional Swift projects are organized.

---

## ✅ Credits

- **BlossomBuild**: The original creators of the tutorial video that guided me through building this app.  
- **freeCodeCamp**: For making the entire course freely available on their [YouTube channel](https://www.youtube.com/@freecodecamp).  
- **TMDB**: This product uses the TMDB API but is not endorsed or certified by TMDB.  
- **YouTube**: Uses the YouTube Data API v3 and IFrame Player.

---

## 📄 License

MIT © 2025 Amulek Angulo
