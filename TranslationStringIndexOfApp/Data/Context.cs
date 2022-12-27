using Microsoft.EntityFrameworkCore;
using TranslationStringIndexOfApp.Models;

namespace TranslationStringIndexOfApp.Data;
public class Context : DbContext
{
    public DbSet<Item> Items { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlite("Data Source=data.db");
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Item>().HasData(
            new Item() { Id = 1, Information = "The dog was barking"},
            new Item() { Id = 2, Information = "The cat was in the tree"}
        );
    }
}