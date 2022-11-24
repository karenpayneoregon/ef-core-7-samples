using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SortByColumnNameApp.Models;

namespace SortByColumnNameApp.Data.Configurations;

public partial class CountriesConfiguration : IEntityTypeConfiguration<Countries>
{
    public void Configure(EntityTypeBuilder<Countries> entity)
    {
        entity.HasKey(e => e.CountryIdentifier);

        OnConfigurePartial(entity);
    }

    partial void OnConfigurePartial(EntityTypeBuilder<Countries> entity);
}