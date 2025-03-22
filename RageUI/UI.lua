RageUI = {}

function RageUI.CreateMenu(title, subtitle)
    local menu = {}
    menu.title = title or "Menu"
    menu.subtitle = subtitle or ""
    menu.isVisible = false
    menu.elements = {}

    function menu:SetVisible(visible)
        self.isVisible = visible
    end

    function menu:AddButton(label, description, callback)
        table.insert(self.elements, {
            label = label,
            description = description,
            callback = callback
        })
    end

    function menu:Render()
        if self.isVisible then
            -- Dessiner le fond du menu
            DrawRect(0.5, 0.3, 0.3, 0.5, 0, 0, 0, 200)
            
            -- Titre
            SetTextFont(1)
            SetTextScale(1.0, 1.0)
            SetTextColour(255, 255, 255, 255)
            SetTextCentre(true)
            SetTextEntry("STRING")
            AddTextComponentString(self.title)
            DrawText(0.5, 0.15)

            -- Afficher les boutons
            for i, item in ipairs(self.elements) do
                local y = 0.25 + (i * 0.05)
                SetTextScale(0.4, 0.4)
                SetTextEntry("STRING")
                AddTextComponentString(item.label)
                DrawText(0.45, y)

                -- Gestion du clic
                if IsControlJustPressed(1, 201) then -- 201 = ENTER
                    if item.callback then
                        item.callback()
                    end
                end
            end
        end
    end

    return menu
end
