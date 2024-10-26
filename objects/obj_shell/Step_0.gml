if saveHistory
{
    if (!loadedSavedHistory)
    {
        self._load_history()
        loadedSavedHistory = true
    }
    else if ((!loadedHistoryScrolled) && isOpen)
    {
        targetScrollPosition = maxScrollPosition
        scrollPosition = maxScrollPosition
        loadedHistoryScrolled = true
    }
}
if (!isOpen)
{
    if self._key_combo_pressed(openModifiers, openKey)
        self.open()
}
else
{
    var prevConsoleString = consoleString
    if (metaDeleted && keyboard_check_released(vk_backspace))
        metaDeleted = false
    if (metaMovedLeft && keyboard_check_released(vk_left))
        metaMovedLeft = false
    if (metaMovedRight && keyboard_check_released(vk_right))
        metaMovedRight = false
    if keyboard_check_pressed(vk_f5)
    {
        if isAutocompleteOpen
            self._close_autocomplete()
        else
            self.close()
    }
    else if (self._key_combo_pressed([metaKey], 65) || keyboard_check_pressed(vk_home))
    {
        cursorPos = 1
        targetScrollPosition = maxScrollPosition
    }
    else if (self._key_combo_pressed([metaKey], 69) || keyboard_check_pressed(vk_end))
    {
        cursorPos = string_length(consoleString) + 1
        targetScrollPosition = maxScrollPosition
    }
    else if self._key_combo_pressed([metaKey], 75)
    {
        var leftSide = string_copy(consoleString, 0, (cursorPos - 1))
        var rightSide = string_copy(consoleString, cursorPos, (string_length(consoleString) - cursorPos + 1))
        killedString = rightSide
        consoleString = leftSide
        cursorPos = string_length(consoleString) + 1
        targetScrollPosition = maxScrollPosition
    }
    else if self._key_combo_pressed([metaKey], 89)
    {
        consoleString += killedString
        killedString = ""
        cursorPos = string_length(consoleString) + 1
        targetScrollPosition = maxScrollPosition
    }
    else if self._key_combo_pressed([metaKey], 67)
    {
        array_push(output, (">" + consoleString + "^C"))
        consoleString = ""
        cursorPos = 1
        targetScrollPosition = maxScrollPosition
    }
    else if (self._key_combo_pressed([metaKey], 8) || (metaKey == 17 && ord(keyboard_string) == 127))
    {
        var precedingSpaceIndex = 1
        var i = cursorPos - 2
        while (i > 1)
        {
            if (string_char_at(consoleString, i) == " ")
            {
                precedingSpaceIndex = i
                break
            }
            else
                i--
        }
        consoleString = string_delete(consoleString, precedingSpaceIndex, (cursorPos - precedingSpaceIndex))
        cursorPos = precedingSpaceIndex
        targetScrollPosition = maxScrollPosition
        keyboard_string = ""
        metaDeleted = true
    }
    else if self._key_combo_pressed([metaKey], 37)
    {
        precedingSpaceIndex = 1
        i = cursorPos - 2
        while (i > 1)
        {
            if (string_char_at(consoleString, i) == " ")
            {
                precedingSpaceIndex = i
                break
            }
            else
                i--
        }
        cursorPos = precedingSpaceIndex
        targetScrollPosition = maxScrollPosition
        metaMovedLeft = true
    }
    else if self._key_combo_pressed([metaKey], 39)
    {
        var nextSpaceIndex = string_length(consoleString) + 1
        i = cursorPos + 2
        while (i <= (string_length(consoleString) + 1))
        {
            if (string_char_at(consoleString, i) == " ")
            {
                nextSpaceIndex = i
                break
            }
            else
                i++
        }
        cursorPos = nextSpaceIndex
        targetScrollPosition = maxScrollPosition
        metaMovedRight = true
    }
    else if self._keyboard_check_delay(8)
    {
        if (!metaDeleted)
        {
            consoleString = string_delete(consoleString, (cursorPos - 1), 1)
            cursorPos = max(1, (cursorPos - 1))
            targetScrollPosition = maxScrollPosition
        }
    }
    else if self._keyboard_check_delay(46)
    {
        consoleString = string_delete(consoleString, cursorPos, 1)
        targetScrollPosition = maxScrollPosition
    }
    else if self._keyboard_check_delay(37)
    {
        if (!metaMovedLeft)
        {
            cursorPos = max(1, (cursorPos - 1))
            targetScrollPosition = maxScrollPosition
        }
    }
    else if self._keyboard_check_delay(39)
    {
        if (!metaMovedRight)
        {
            if (cursorPos == (string_length(consoleString) + 1) && array_length(filteredSuggestions) != 0)
            {
                var suggestion = filteredSuggestions[suggestionIndex]
                var consoleWords = self._input_string_split(consoleString)
                var currentWordLength = string_length(consoleWords[(array_length(consoleWords) - 1)])
                consoleString += string_copy(suggestion, (currentWordLength + 1), (string_length(suggestion) - currentWordLength))
                cursorPos = string_length(consoleString) + 1
            }
            else
                cursorPos = min((string_length(consoleString) + 1), (cursorPos + 1))
            targetScrollPosition = maxScrollPosition
        }
    }
    else if self._key_combo_pressed(historyUpModifiers, historyUpKey)
    {
        if (historyPos == array_length(history))
            savedConsoleString = consoleString
        historyPos = max(0, (historyPos - 1))
        if (array_length(history) != 0)
        {
            consoleString = array_get(history, historyPos)
            cursorPos = string_length(consoleString) + 1
        }
        targetScrollPosition = maxScrollPosition
    }
    else if self._key_combo_pressed(historyDownModifiers, historyDownKey)
    {
        if (historyPos < array_length(history))
        {
            historyPos = min(array_length(history), (historyPos + 1))
            if (historyPos == array_length(history))
                consoleString = savedConsoleString
            else
                consoleString = array_get(history, historyPos)
            cursorPos = string_length(consoleString) + 1
        }
        targetScrollPosition = maxScrollPosition
    }
    else if keyboard_check_pressed(vk_return)
    {
        if isAutocompleteOpen
            self._confirm_current_suggestion()
        else
        {
            var args = self._input_string_split(consoleString)
            if (array_length(args) > 0)
            {
                var metadata = variable_struct_get(functionData, array_get(args, 0))
                if (!is_undefined(metadata))
                {
                    var deferred = false
                    if variable_struct_exists(metadata, "deferred")
                        deferred = metadata.deferred
                    if deferred
                    {
                        ds_queue_enqueue(deferredQueue, args)
                        array_push(history, consoleString)
                        array_push(output, (">" + consoleString))
                        array_push(output, "Execution deferred until shell is closed.")
                        self._update_positions()
                    }
                    else
                        self._execute_script(args)
                }
                else
                    self._execute_script(args)
            }
            else
            {
                array_push(output, ">")
                consoleString = ""
                savedConsoleString = ""
                cursorPos = 1
            }
        }
        commandSubmitted = true
    }
    else if self._key_combo_pressed(cycleSuggestionsModifiers, cycleSuggestionsKey)
    {
        if (array_length(filteredSuggestions) != 0)
        {
            var uncompleted = consoleString
            consoleString = self._find_common_prefix()
            cursorPos = string_length(consoleString) + 1
            if (uncompleted == consoleString)
            {
                suggestionIndex = (suggestionIndex + 1) % array_length(filteredSuggestions)
                if isAutocompleteOpen
                    self._calculate_scroll_from_suggestion_index()
            }
        }
    }
    else if self._key_combo_pressed(cycleSuggestionsReverseModifiers, cycleSuggestionsReverseKey)
    {
        if (array_length(filteredSuggestions) != 0)
        {
            suggestionIndex = (suggestionIndex + array_length(filteredSuggestions) - 1) % array_length(filteredSuggestions)
            if isAutocompleteOpen
                self._calculate_scroll_from_suggestion_index()
        }
    }
    else if keyboard_check_pressed(vk_insert)
        insertMode = (!insertMode)
    else if (keyboard_string != "")
    {
        var t = keyboard_string
        if (!insertMode)
            consoleString = string_delete(consoleString, cursorPos, string_length(t))
        consoleString = string_insert(t, consoleString, cursorPos)
        cursorPos += string_length(t)
        keyboard_string = ""
        targetScrollPosition = maxScrollPosition
    }
    if isAutocompleteOpen
    {
        var x1 = autocompleteOriginX
        var y1 = autocompleteOriginY
        var x2 = x1 + autocompleteMaxWidth + font_get_size(consoleFont) + autocompletePadding * 2 - scrollbarWidth
        var y2 = y1 + string_height(prompt) * (min(array_length(filteredSuggestions), autocompleteMaxLines)) + autocompletePadding
        if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x1, y1, x2, y2)
        {
            if mouse_wheel_down()
            {
                autocompleteScrollPosition++
                autocompleteScrollPosition = clamp((array_length(filteredSuggestions) - autocompleteMaxLines), 0, autocompleteScrollPosition)
            }
            if mouse_wheel_up()
            {
                autocompleteScrollPosition--
                autocompleteScrollPosition = max(autocompleteScrollPosition, 0)
            }
        }
        else if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), shellOriginX, shellOriginY, (shellOriginX + width), (shellOriginY + height))
        {
            if mouse_wheel_down()
                targetScrollPosition += scrollSpeed
            if mouse_wheel_up()
                targetScrollPosition -= scrollSpeed
        }
    }
    else if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), shellOriginX, shellOriginY, (shellOriginX + width), (shellOriginY + height))
    {
        if mouse_wheel_down()
            targetScrollPosition += scrollSpeed
        if mouse_wheel_up()
            targetScrollPosition -= scrollSpeed
    }
    var lerpValue = (scrollSmoothness == 0 ? 1 : self._remap(scrollSmoothness, 1, 0, 0.08, 0.4))
    scrollPosition = lerp(scrollPosition, targetScrollPosition, lerpValue)
    scrollPosition = clamp(scrollPosition, 0, maxScrollPosition)
    if (scrollPosition == 0 || scrollPosition == maxScrollPosition)
        targetScrollPosition = clamp(targetScrollPosition, 0, maxScrollPosition)
    if (consoleString != prevConsoleString)
    {
        self._update_filtered_suggestions()
        autocompleteScrollPosition = 0
    }
    if (self._shell_properties_hash() != shellPropertiesHash)
        self._recalculate_shell_properties()
}
if (!is_undefined(activeMouseArgType))
{
    if (activeMouseArgType == (0 << 0))
        activeMouseArgValue = device_mouse_x(0)
    else if (activeMouseArgType == (1 << 0))
        activeMouseArgValue = device_mouse_y(0)
    else if (activeMouseArgType == (2 << 0))
        activeMouseArgValue = device_mouse_x_to_gui(0)
    else if (activeMouseArgType == (3 << 0))
        activeMouseArgValue = device_mouse_y_to_gui(0)
    else if (activeMouseArgType == (4 << 0))
    {
        var instAtCursor = instance_position(device_mouse_x(0), device_mouse_y(0), all)
        if (instAtCursor != noone)
            activeMouseArgValue = instAtCursor
        else
            activeMouseArgValue = ""
    }
    else if (activeMouseArgType == (5 << 0))
    {
        instAtCursor = instance_position(device_mouse_x(0), device_mouse_y(0), all)
        if (instAtCursor != noone)
            activeMouseArgValue = instAtCursor.object_index
        else
            activeMouseArgValue = ""
    }
}
