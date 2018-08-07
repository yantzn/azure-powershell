﻿# <auto-generated>
# Copyright (c) Microsoft and contributors.  All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# 
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# 
# Warning: This code was generated by a tool.
# 
# Changes to this file may cause incorrect behavior and will be lost if the
# code is regenerated.
# 
# For documentation on code generator please visit
#   https://aka.ms/nrp-code-generation
# Please contact wanrpdev@microsoft.com if you need to make changes to this file.
# </auto-generated>

function Check-CmdletReturnType
{
    param($cmdletName, $cmdletReturn)

    $cmdletData = Get-Command $cmdletName;
    Assert-NotNull $cmdletData;
    [array]$cmdletReturnTypes = $cmdletData.OutputType.Name | Foreach-Object { return ($_ -replace "Microsoft.Azure.Commands.Network.Models.","") };
    [array]$cmdletReturnTypes = $cmdletReturnTypes | Foreach-Object { return ($_ -replace "System.","") };
    $realReturnType = $cmdletReturn.GetType().Name -replace "Microsoft.Azure.Commands.Network.Models.","";
    return $cmdletReturnTypes -contains $realReturnType;
}

<#
.SYNOPSIS
Test creating new ApplicationSecurityGroup using minimal set of parameters
#>
function Test-ApplicationSecurityGroupCRUDMinimalParameters
{
    # Setup
    $rgname = Get-ResourceGroupName;
    $rglocation = Get-ProviderLocation ResourceManagement;
    $rname = Get-ResourceName;
    $location = Get-ProviderLocation "Microsoft.Network/ApplicationSecurityGroups";

    try
    {
        $resourceGroup = New-AzureRmResourceGroup -Name $rgname -Location $rglocation;

        # Create ApplicationSecurityGroup
        $vApplicationSecurityGroup = New-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname -Location $location;
        Assert-NotNull $vApplicationSecurityGroup;
        Assert-True { Check-CmdletReturnType "New-AzureRmApplicationSecurityGroup" $vApplicationSecurityGroup };
        Assert-AreEqual $rname $vApplicationSecurityGroup.Name;

        # Get ApplicationSecurityGroup
        $vApplicationSecurityGroup = Get-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname;
        Assert-NotNull $vApplicationSecurityGroup;
        Assert-True { Check-CmdletReturnType "Get-AzureRmApplicationSecurityGroup" $vApplicationSecurityGroup };
        Assert-AreEqual $rname $vApplicationSecurityGroup.Name;

        # Remove ApplicationSecurityGroup
        $removeApplicationSecurityGroup = Remove-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname -PassThru -Force;
        Assert-AreEqual $true $removeApplicationSecurityGroup;

        # Get ApplicationSecurityGroup should fail
        Assert-ThrowsContains { Get-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname } "${rname} not found";
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname;
    }
}

<#
.SYNOPSIS
Test creating new ApplicationSecurityGroup
#>
function Test-ApplicationSecurityGroupCRUDAllParameters
{
    # Setup
    $rgname = Get-ResourceGroupName;
    $rglocation = Get-ProviderLocation ResourceManagement;
    $rname = Get-ResourceName;
    $location = Get-ProviderLocation "Microsoft.Network/ApplicationSecurityGroups";
    # Resource's parameters
    $Tag = @{tag1='test'};

    try
    {
        $resourceGroup = New-AzureRmResourceGroup -Name $rgname -Location $rglocation;

        # Create ApplicationSecurityGroup
        $vApplicationSecurityGroup = New-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname -Location $location -Tag $Tag;
        Assert-NotNull $vApplicationSecurityGroup;
        Assert-True { Check-CmdletReturnType "New-AzureRmApplicationSecurityGroup" $vApplicationSecurityGroup };
        Assert-AreEqual $rname $vApplicationSecurityGroup.Name;
        Assert-AreEqualObjectProperties $Tag $vApplicationSecurityGroup.Tag;

        # Get ApplicationSecurityGroup
        $vApplicationSecurityGroup = Get-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname;
        Assert-NotNull $vApplicationSecurityGroup;
        Assert-True { Check-CmdletReturnType "Get-AzureRmApplicationSecurityGroup" $vApplicationSecurityGroup };
        Assert-AreEqual $rname $vApplicationSecurityGroup.Name;
        Assert-AreEqualObjectProperties $Tag $vApplicationSecurityGroup.Tag;

        # Remove ApplicationSecurityGroup
        $removeApplicationSecurityGroup = Remove-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname -PassThru -Force;
        Assert-AreEqual $true $removeApplicationSecurityGroup;

        # Get ApplicationSecurityGroup should fail
        Assert-ThrowsContains { Get-AzureRmApplicationSecurityGroup -ResourceGroupName $rgname -Name $rname } "${rname} not found";
    }
    finally
    {
        # Cleanup
        Clean-ResourceGroup $rgname;
    }
}