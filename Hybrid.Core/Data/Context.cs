﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Hybrid.Core.Classes;
using Hybrid.Core.Models;
using Microsoft.EntityFrameworkCore;

namespace Hybrid.Core.Data;

public partial class Context : DbContext
{
    public Context()
    {
    }

    public Context(DbContextOptions<Context> options)
        : base(options)
    {
    }

    public virtual DbSet<Applications> Applications { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            ConnectionHelpers.NoLoggingSqlServer(optionsBuilder);
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Applications>(entity =>
        {
            entity.HasKey(e => e.ApplicationId).HasName("PK_Application"); ;

            entity.Property(e => e.ApplicationName)
                .IsRequired();

            entity.Property(e => e.ContactName)
                .IsRequired();

        });

        modelBuilder.Entity<Applications>().OwnsOne(
            owner => owner.MailSettings, ownedNavigationBuilder =>
            {
                ownedNavigationBuilder.ToJson();
            });

        modelBuilder.Entity<Applications>().OwnsOne(
            owner => owner.GeneralSettings, ownedNavigationBuilder =>
            {
                ownedNavigationBuilder.ToJson();
            });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}