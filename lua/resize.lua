local M = {}

M.setup = function(_) end

M.isRightMost = function()
  local curWin = vim.fn.winnr()
  vim.cmd "wincmd l"
  local rightWin = vim.fn.winnr()
  if curWin == rightWin then
    return true
  else
    vim.cmd "wincmd h"
    return false
  end
end

M.isLeftMost = function()
  local curWin = vim.fn.winnr()
  vim.cmd "wincmd h"
  local leftWin = vim.fn.winnr()
  if curWin == leftWin then
    return true
  else
    vim.cmd "wincmd l"
    return false
  end
end

M.isBottomMost = function()
  local curWin = vim.fn.winnr()
  vim.cmd "wincmd j"
  local bottomWin = vim.fn.winnr()
  if curWin == bottomWin then
    return true
  else
    vim.cmd "wincmd k"
    return false
  end
end

M.isTopMost = function()
  local curWin = vim.fn.winnr()
  vim.cmd "wincmd k"
  local topWin = vim.fn.winnr()
  if curWin == topWin then
    return true
  else
    vim.cmd "wincmd j"
    return false
  end
end

M.ResizeLeft = function(num)
  if M.isRightMost() and not M.isLeftMost() then
    vim.cmd("wincmd " .. num .. " >")
  else
    vim.cmd("wincmd " .. num .. " <")
  end
end

M.ResizeRight = function(num)
  if M.isRightMost() and not M.isLeftMost() then
    vim.cmd("wincmd " .. num .. " <")
  else
    vim.cmd("wincmd " .. num .. " >")
  end
end

M.ResizeUp = function(num)
  if M.isBottomMost() and not M.isTopMost() then
    vim.cmd("wincmd " .. num .. " +")
  else
    vim.cmd("wincmd " .. num .. " -")
  end
end

M.ResizeDown = function(num)
  if M.isBottomMost() and not M.isTopMost() then
    vim.cmd("wincmd " .. num .. " -")
  else
    vim.cmd("wincmd " .. num .. " +")
  end
end

return M
