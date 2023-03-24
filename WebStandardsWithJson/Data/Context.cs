﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace WebStandardsWithJson.Models;

public partial class Context : DbContext
{
    public Context()
    {
    }

    public Context(DbContextOptions<Context> options) : base(options)
    {
    }

    public virtual DbSet<WebStandards> WebStandards { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer(
            """
                Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=EF.Json;Integrated Security=True
               """);

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<WebStandards>(entity =>
        {
            entity.HasKey(e => e.Identifier);
        });
        
        modelBuilder.Entity<WebStandards>().OwnsMany(
            ws => ws.RelatedList, ownedNavigationBuilder =>
            {
                ownedNavigationBuilder.ToJson();
            });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}