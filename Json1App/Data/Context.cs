﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using Json1App.Classes;
using Json1App.Models;
using Microsoft.EntityFrameworkCore;

namespace Json1App.Data;

public partial class Context : DbContext
{
    public Context() { }
    public Context(DbContextOptions<Context> options) : base(options) { }

    public virtual DbSet<Person> Person { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            ConnectionHelpers.NoLoggingSqlServer(optionsBuilder);
        }
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Person>(entity =>
        {
            entity.Property(e => e.DateOfBirth).HasColumnType("datetime");
            entity.Property(e => e.FirstName).IsRequired();
            entity.Property(e => e.LastName).IsRequired();
        });

        modelBuilder.Entity<Person>().OwnsMany(
            post => post.Addresses, ownedNavigationBuilder =>
            {
                ownedNavigationBuilder.ToJson();
            });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}