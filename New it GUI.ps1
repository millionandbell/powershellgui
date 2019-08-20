Add-Type -assembly System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
## microsoft cp

## microsoft ccp

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='GUI for IT script'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true

#create label

$label = New-Object System.Windows.Forms.Label
$Label.Text = "Tasks:"
$Label.Location  = New-Object System.Drawing.Point(0,10)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)
$MyCredential = Get-Credential

#Create button for renaming computer

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(50,10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Rename Computer"



${function:RenamePC} = {
  param (
    ${oldname},
    ${newname}
    )
    Rename-Computer -ComputerName $oldname -domaincredential $MyCredential -NewName $newname -Force
}
#onclick function
$button.add_click(
{
show-command "RenamePC"
}
)

$main_form.Controls.Add($Button)

#create button for new user

$main_form.ShowDialog()

