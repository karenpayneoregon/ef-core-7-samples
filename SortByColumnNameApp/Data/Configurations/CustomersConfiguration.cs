using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SortByColumnNameApp.Models;

namespace SortByColumnNameApp.Data.Configurations;

public partial class CustomersConfiguration : IEntityTypeConfiguration<Customers>
{
    public void Configure(EntityTypeBuilder<Customers> entity)
    {
        entity.HasKey(e => e.CustomerIdentifier)
            .HasName("PK_Customers_1");

        entity.HasIndex(e => e.CompanyName, "CompanyName");

        entity.HasIndex(e => e.ContactId, "IX_Customers_ContactId");

        entity.HasIndex(e => e.ContactTypeIdentifier, "IX_Customers_ContactTypeIdentifier");

        entity.HasIndex(e => e.CountryIdentifier, "IX_Customers_CountryIdentifier");
            
        entity.Property(e => e.CompanyName)
            .IsRequired()
            .HasMaxLength(40)
            .HasComment("Company");

        entity.HasOne(d => d.Contact)
            .WithMany(p => p.Customers)
            .HasForeignKey(d => d.ContactId)
            .HasConstraintName("FK_Customers_Contacts");

        entity.HasOne(d => d.ContactTypeNavigation)
            .WithMany(p => p.Customers)
            .HasForeignKey(d => d.ContactTypeIdentifier)
            .HasConstraintName("FK_Customers_ContactType");

        entity.HasOne(d => d.CountryNavigation)
            .WithMany(p => p.Customers)
            .HasForeignKey(d => d.CountryIdentifier)
            .HasConstraintName("FK_Customers_Countries");

        OnConfigurePartial(entity);
    }

    partial void OnConfigurePartial(EntityTypeBuilder<Customers> entity);
}