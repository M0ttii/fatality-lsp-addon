> ⚠ **Warning:** Addon is not complete, support for gui for example is missing at all, some other things might not be working as well, contributions are welcome

# Fatality Lua API Support for VSCode

This addon adds **Fatality Lua API** support to the [Sumneko Lua Language Server](https://github.com/LuaLS/lua-language-server), enabling **syntax highlighting and hover docs**.  

## 📦 Installation  
1. **Clone the repository**  
   ```sh
   git clone https://github.com/m0ttii/fatality-lsp-addon.git
   ``` 
2. **Install Lua Language Server**
    https://github.com/LuaLS/lua-language-server

3. **Configure `settings.json`**  
   ```json
   {
     "Lua.workspace.userThirdParty":        ["C:\Users\me\Documents\LuaAddons"],
     "Lua.workspace.library": ["C:\Users\me\Documents\LuaAddons\fatality-lsp-addon\library"],
   }
   ```
4. **Restart VSCode** – Fatality API support should now work! 🎯  

## 🛠️ Contributing  
PRs and issues are welcome!  