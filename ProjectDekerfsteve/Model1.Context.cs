﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace ProjectDekerfsteve
{

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class INFO_c1035462Entities : DbContext
{
    public INFO_c1035462Entities()
        : base("name=INFO_c1035462Entities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<evenement> Proj_evenementen { get; set; }

    public virtual DbSet<Gemeente> Proj_gemeenten { get; set; }

    public virtual DbSet<Vragen> Proj_Vragen { get; set; }

    public virtual DbSet<inschrijving> proj_inschrijvingen { get; set; }

}

}

