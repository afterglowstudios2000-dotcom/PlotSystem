# PlotSystem

A simple Roblox plot management system that assigns a unique plot to each player when they join the game.

---

## Setup

1. **Plots Folder**
   - Place all your plot models inside a folder named `Plots`.
   - Each plot should have:
     - A `Part` (or model) for the physical plot
     - An `IntValue` named `OwnerValue` (default `0`) to track ownership
   - Position each plot manually using the model’s properties or attributes.
   - If you want multiple plots, create a separate model for each plot inside the `Plots` folder.

2. **Folder Location**
   - By default, the code looks for:

     ```lua
     ServerStorage.Plots
     ```

   - If you change the folder location, update the `plotsFolder` line in `PlotService.AssignPlotToPlayer`:

     ```lua
     local plotsFolder = ServerStorage:WaitForChild("YourFolderName")
     ```

---

## Usage

1. **Add services to ServerScriptService**
   - Create a folder `Server/Services` (or your preferred location)
   - Add `PlotService` and `PlayerService` modules there

2. **Start the player service**
   - Hook `PlayerService.Start()` up to your module loader however you normally do.

3. **Assign plots**
   - When a player joins:
     - `PlayerService` calls `PlotService.AssignPlotToPlayer`
     - The first unclaimed plot (`OwnerValue.Value == 0`) is assigned to the player
     - The plot is moved from `ServerStorage.Plots` to `workspace`

---

## Notes

- Each plot’s **position must be set manually**. The system does not automatically generate or move plots.
- `OwnerValue` is used to track which player owns each plot:
  - `0` = unclaimed
  - `player.UserId` = claimed by that player
- If you want 10 plots, make **10 separate models** inside the `Plots` folder.
- The `PlotService.Start()` function is currently empty but can be used for future initialization logic.

---

## Example Folder Structure
ServerStorage
└─ Plots
├─ Plot1
│ ├─ Baseplate (Part)
│ └─ OwnerValue (IntValue)
├─ Plot2
└─ Plot3

ServerScriptService
└─ Server
└─ Services
├─ PlotService.lua
└─ PlayerService.lua
