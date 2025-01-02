using ConsoleApp_ADO_10_CodeFirst__.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Security.Policy;
using Publisher = ConsoleApp_ADO_10_CodeFirst__.Models.Publisher;

namespace ConsoleApp_ADO_10_CodeFirst__.Helpers
{
     class LibraryDB
    {
        private LibraryContext _context;

        public LibraryDB()
        {
            try
            {
                _context = new LibraryContext();
                
                if (!_context.Database.Exists())
                {
                    Country country = new Country { CountryName = "Ukraine" };
                    Author author = new Author
                    {
                        LastName = "Shevchenko",
                        FirstName = "Taras",
                    };
                    Book book = new Book { Titel = "Kobzar" }; 
                    
                    author.Books.Add(book);
                    
                    _context.Authors.Add(author);

                    _context.Accounts.Add(
                       new Account
                       {
                           Id = author.Id,
                           Login = "taraasS",
                           Password = "12aqs4sdwe123",
                       });
                    _context.Authors.Add(author);
                    _context.Countries.AddRange(
                        new List<Country> { country,
                        new Country{CountryName="Poland"},
                        new Country {CountryName="Litva"},});

                    Publisher publisher = new Publisher { PublisherName = "Ranok" };
                publisher.Books.Add(book);
                    _context.Publishers.Add(publisher);

                    _context.Books.Add(
                        new Book
                        {
                            Titel = "C#",
                            Publishers = new List<Publisher>
                            {
                              new Publisher {PublisherName="Microsoft"},
                              publisher
                            }
                        });
                    _context.SaveChanges();

                    _context.Authors.Add(
                        new Author
                        {
                            LastName = "Moore",
                            FirstName = "Oliver",
                            Country = _context.Countries.First(c => c.CountryName == "Litva"),
                        });
                    _context.SaveChanges();

//  author = _context.Authors.FirstOrDefault(a => a.LastName == "Moore" && a.FirstName = "Oliver");
//                    if (author != null)
//                    {
//                        (author.Books as List<Book>).AddRange(
//                            new Book {
//                                Titel = "Flowers",
//                                _context.Books.First(b => b.Titel == "C#"),
//                            }
//                            );
                            
                            
//                    }
                    _context.SaveChanges();

                    Console.WriteLine("Database OK!");
                }
                else
                {
                    Console.WriteLine("Database existis!");
                }
            }
            catch 
            {

                throw;
            }
           
             
        }  public  void Show()
        {
            foreach (Book item in _context.Books.Include(b=>b.Authors).Include(b=>b.Publishers).ToList())
            {
                Console.Write(new string('\t',2));
                Console.WriteLine(item.Titel);

                foreach (Author author in item.Authors)
                {
                    Console.Write(new string('\t', 3));

                    //explicit loading
                    _context.Entry(author).Reference("Country").Load();

                    Console.WriteLine($"{author} {author.Country.CountryName}");
                }
                foreach (Publisher publisher in item.Publishers)
                {
                    Console.Write(new string('\t', 4));
                    Console.WriteLine(publisher.PublisherName);
                }
            }
            Console.WriteLine("\n------------------------\n");
            //lazy loading
            foreach (Country c in _context.Countries)
            {
                Console.WriteLine(c.CountryName);
                foreach (Author a in c.Authors)
                {
                    Console.Write(new string('\t', 2));
                    Console.WriteLine(a);

                    foreach (Book b in a.Books)
                    {
                        Console.Write(new string('\t', 3));
                        Console.WriteLine(b.Titel);

                        foreach (Publisher p in b.Publishers)
                        {
                            Console.Write(new string('\t', 4));
                            Console.WriteLine(p.PublisherName);
                        }
                    }
                }

            }
        }
    }
}
