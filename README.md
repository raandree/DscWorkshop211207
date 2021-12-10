# DscWorkshop211207

## Useful DSC resources

- Landing page: 
  - [DSC Community](http://dsccommunity.org/)
    - Overview of all community driven [Resource Modules](https://dsccommunity.org/resources/)
  - [Microsoft365DSC](https://microsoft365dsc.com/)  - 
- [Separating configuration and environment data](https://docs.microsoft.com/en-us/powershell/scripting/dsc/configurations/separatingEnvData?view=powershell-7.2)
- How DSC composite Resources work, an example: [DSCSQLCompositeResources](https://github.com/raandree/DSCSQLCompositeResources)

## DscWorkshop Blueprint

The basis for the next links is the whitepaper [The Release Pipeline Model](https://aka.ms/trpm). We have tried to adapt most of the principals and patterns when creating the DscWorkshop. 

-	The repository is a blueprint of a flexible and comprehensive DSC solution. The purpose of this project is to demonstrate DSC in an end-to-end CI/CD scenario. Key features are:

    - Sophisticated config management using Datum (similar to Puppet Hiera).
    - A single build script that creates all artifacts (MOF, MetaMOF, Compressed Modules)
    - Build and Release based on TFS or Azure DevOps. Manually triggered local builds do also work.
    - Fully automated dependency management using PSDepends. No manual module / DSC resource download required.
    - The concept works with Push, on-prem Pull or Azure Automation Account.
    - Maintenance windows are supported.
    - For on-prem Pull there is reporting available based on SQL Server Reporting Services. 

The [CommonTasks](https://github.com/dsccommunity/CommonTasks) repository is an essential part as it demos how to provide configurations as building blocks that can be assigned to layers (roles, locations, nodes, etc.).

Technologies / products / open source tools involved are:
-	Azure DevOps, Azure DevOps Server
-	Azure DevOps Artifacts Feed
-	SQL Server 2017 and Reporting Services
-	Active Directory
-	Active Directory Certificate Services
-	JEA
-	PSDepend
-	InvokeBuild
-	Pester
-	Datum

The DscWorkshop offers some [exercises](https://github.com/dsccommunity/DscWorkshop/tree/main/Exercises) that I would like to recommend to guide you through the concepts at your own pace another time.

## AutomatedLab

To create yourself a test or development environment, you may use [AutomatedLab](https://automatedlab.org/en/latest/). The are some introduction videos about AutomatedLab on YouTube and some articles as well. For starters, have a look at the [Sample Scripts](https://github.com/AutomatedLab/AutomatedLab/tree/develop/LabSources/SampleScripts). For more advanced stuff you may want to make yourself familiar with the [DscWorkshop Lab Scripts](https://github.com/dsccommunity/DscWorkshop/tree/main/Lab)
