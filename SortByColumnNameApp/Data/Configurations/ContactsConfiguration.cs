using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SortByColumnNameApp.Models;

namespace SortByColumnNameApp.Data.Configurations;

public partial class ContactsConfiguration : IEntityTypeConfiguration<Contacts>
{
    public void Configure(EntityTypeBuilder<Models.Contacts> entity)
    {
        entity.HasKey(e => e.ContactId);

        entity.HasIndex(e => e.ContactTypeIdentifier, "IX_Contacts_ContactTypeIdentifier");

        entity.HasOne(d => d.ContactTypeNavigation)
            .WithMany(p => p.Contacts)
            .HasForeignKey(d => d.ContactTypeIdentifier)
            .HasConstraintName("FK_Contacts_ContactType");

        OnConfigurePartial(entity);
    }

    partial void OnConfigurePartial(EntityTypeBuilder<Contacts> entity);
}