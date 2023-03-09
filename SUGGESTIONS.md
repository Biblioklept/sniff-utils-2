# I think X mod should be added!

While I do take all kinds of mod suggestions, I prioritize ones over others depending on the following criteria:

### REQUIRED
- The mod/s you suggest must be **free to redistribute** (for _obvious_ reasons), you can find out about it in the mod's _License_ tab (if there's nothing in it or there's no tab it's safe to assume it can be reuploaded).

- **No gameplay changes**. This is supposed to be a quality-of-life mod collection that makes the current experience more comfortable/enjoyable. More info on this later.

### OPTIONAL
<sup>Your suggestion doesn't need to meet the following requirements but I may consider them over others that don't.</sup>

- **The less intrusive and more newbie-friendly, the better**. To adapt to all types of players who might download Sniff's Utils, it's preferable if nothing severely impacts how the game feels or looks.

- **Utility over looks**. Extra points if your suggestion solves an issue with the vanilla game that isn't necessarily fatal but rather annoying.

---
# How to add your own mods

You can also add mods to your local Sniff's Utils folder (or any other mod's) quite easily:
- Locate the **Lua hooks** and **.lua files** of the mod you want to add

  The .lua files will typically be in a folder called `lua` in the mod's root folder (if not, just check elsewhere!). The Lua hooks are contained in the `mod.txt` file     (which **all mods contain** as it's needed for the mod loader to recognize them) inside the `hooks: [` line, and all the way down to the next `]` character. You don't   have to care about what hooks do if you're just putting mods together, just know they point to a specific part of the PAYDAY 2 code to alter it with its respective       .lua file, which it links to right afterwards.

- **Store the .lua files** anywhere on the mod's root folder and copy the Lua hooks to your mod's own `hooks` section

  If the hooks point to the wrong location just change them manually after `"script_path":` for every hook you need (they use relative file paths, they start from where   `mod.txt` is located).
  
- **Save** the changes made to `mod.txt` and put your mod in PAYDAY 2's `mods` folder if you haven't already. You're now done!

- If you're doing this with a mod with auto-updates, delete them by deleting `"updates": [` all the way to its ending `]`

  You can toggle the Developer information in-game to see if everything is hooked properly, and test your mods in a random or dedicated testing heist like [Proving Grounds](https://modworkshop.net/mod/29905).
