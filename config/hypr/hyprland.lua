
-- https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------
require("modulo.monitores")

---------------------
---- MY PROGRAMS ----
---------------------
require("modulo.programas")

-------------------
---- AUTOSTART ----
-------------------
require("modulo.autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
require("modulo.ambiente")

-----------------------
----- PERMISSIONS -----
-----------------------
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
require("modulo.estetica")

---------------
---- INPUT ----
---------------
require("modulo.inputs")

---------------------
---- KEYBINDINGS ----
---------------------
require("modulo.atalhos")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
require("modulo.janelas")
