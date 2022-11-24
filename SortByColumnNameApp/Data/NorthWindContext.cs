using System.Diagnostics;
using ConfigurationLibrary.Classes;
using Microsoft.EntityFrameworkCore;
using SortByColumnNameApp.Models;

namespace SortByColumnNameApp.Data;

public partial class NorthWindContext : DbContext
{
    public NorthWindContext()
    {
    }

    public NorthWindContext(DbContextOptions<NorthWindContext> options) : base(options)
    {
    }

    public virtual DbSet<ContactType> ContactType { get; set; }
    public virtual DbSet<Contacts> Contacts { get; set; }
    public virtual DbSet<Countries> Countries { get; set; }
    public virtual DbSet<Customers> Customers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer(ConfigurationHelper.ConnectionString())
            .EnableSensitiveDataLogging()
            .LogTo(message => Debug.WriteLine(message));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {

        modelBuilder.ApplyConfiguration(new Configurations.ContactTypeConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.ContactsConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.CountriesConfiguration());
        modelBuilder.ApplyConfiguration(new Configurations.CustomersConfiguration());
        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}